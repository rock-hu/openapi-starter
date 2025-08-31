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
-- Name: agreement; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement (
    agreement_id character varying(20) NOT NULL,
    product_id character varying(20),
    party_id_from character varying(20),
    party_id_to character varying(20),
    role_type_id_from character varying(20),
    role_type_id_to character varying(20),
    agreement_type_id character varying(20),
    agreement_date timestamp with time zone,
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    description character varying(255),
    text_data text,
    status_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement OWNER TO ofbiz;

--
-- Name: agreement pk_agreement; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement
    ADD CONSTRAINT pk_agreement PRIMARY KEY (agreement_id);


--
-- Name: agreement_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agreement_txcrts ON agreement USING btree (created_tx_stamp);


--
-- Name: agreement_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agreement_txstmp ON agreement USING btree (last_updated_tx_stamp);


--
-- Name: agrmnt_fprtyrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_fprtyrle ON agreement USING btree (party_id_from, role_type_id_from);


--
-- Name: agrmnt_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_product ON agreement USING btree (product_id);


--
-- Name: agrmnt_tprtyrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_tprtyrle ON agreement USING btree (party_id_to, role_type_id_to);


--
-- Name: agrmnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_type ON agreement USING btree (agreement_type_id);


--
-- Name: agreement agrmnt_fprtyrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement
    ADD CONSTRAINT agrmnt_fprtyrle FOREIGN KEY (party_id_from, role_type_id_from) REFERENCES party_role(party_id, role_type_id);


--
-- Name: agreement agrmnt_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement
    ADD CONSTRAINT agrmnt_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: agreement agrmnt_tprtyrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement
    ADD CONSTRAINT agrmnt_tprtyrle FOREIGN KEY (party_id_to, role_type_id_to) REFERENCES party_role(party_id, role_type_id);


--
-- Name: agreement agrmnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement
    ADD CONSTRAINT agrmnt_type FOREIGN KEY (agreement_type_id) REFERENCES agreement_type(agreement_type_id);


--
-- PostgreSQL database dump complete
--

