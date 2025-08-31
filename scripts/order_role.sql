--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: order_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_role (
    order_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_role OWNER TO ofbiz;

--
-- Name: order_role pk_order_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_role
    ADD CONSTRAINT pk_order_role PRIMARY KEY (order_id, party_id, role_type_id);


--
-- Name: order_role_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_role_ohdr ON order_role USING btree (order_id);


--
-- Name: order_role_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_role_party ON order_role USING btree (party_id);


--
-- Name: order_role_prole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_role_prole ON order_role USING btree (party_id, role_type_id);


--
-- Name: order_role_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_role_txcrts ON order_role USING btree (created_tx_stamp);


--
-- Name: order_role_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_role_txstmp ON order_role USING btree (last_updated_tx_stamp);


--
-- Name: order_role order_role_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_role
    ADD CONSTRAINT order_role_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_role order_role_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_role
    ADD CONSTRAINT order_role_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: order_role order_role_prole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_role
    ADD CONSTRAINT order_role_prole FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

