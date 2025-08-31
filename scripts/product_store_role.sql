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
-- Name: product_store_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_role (
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    product_store_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_role OWNER TO ofbiz;

--
-- Name: product_store_role pk_product_store_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_role
    ADD CONSTRAINT pk_product_store_role PRIMARY KEY (party_id, role_type_id, product_store_id, from_date);


--
-- Name: prdstrrle_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrrle_prds ON product_store_role USING btree (product_store_id);


--
-- Name: prdstrrle_prle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrrle_prle ON product_store_role USING btree (party_id, role_type_id);


--
-- Name: prdt_str_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_rl_txcrts ON product_store_role USING btree (created_tx_stamp);


--
-- Name: prdt_str_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_rl_txstmp ON product_store_role USING btree (last_updated_tx_stamp);


--
-- Name: product_store_role prdstrrle_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_role
    ADD CONSTRAINT prdstrrle_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_store_role prdstrrle_prle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_role
    ADD CONSTRAINT prdstrrle_prle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

