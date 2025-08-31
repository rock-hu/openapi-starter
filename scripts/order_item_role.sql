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
-- Name: order_item_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_role (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_role OWNER TO ofbiz;

--
-- Name: order_item_role pk_order_item_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_role
    ADD CONSTRAINT pk_order_item_role PRIMARY KEY (order_id, order_item_seq_id, party_id, role_type_id);


--
-- Name: order_itrl_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itrl_ohdr ON order_item_role USING btree (order_id);


--
-- Name: order_itrl_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itrl_oitm ON order_item_role USING btree (order_id, order_item_seq_id);


--
-- Name: order_itrl_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itrl_party ON order_item_role USING btree (party_id);


--
-- Name: order_itrl_ptrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itrl_ptrle ON order_item_role USING btree (party_id, role_type_id);


--
-- Name: ordr_itm_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_itm_rl_txcrts ON order_item_role USING btree (created_tx_stamp);


--
-- Name: ordr_itm_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_itm_rl_txstmp ON order_item_role USING btree (last_updated_tx_stamp);


--
-- Name: order_item_role order_itrl_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_role
    ADD CONSTRAINT order_itrl_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_item_role order_itrl_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_role
    ADD CONSTRAINT order_itrl_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: order_item_role order_itrl_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_role
    ADD CONSTRAINT order_itrl_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: order_item_role order_itrl_ptrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_role
    ADD CONSTRAINT order_itrl_ptrle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

