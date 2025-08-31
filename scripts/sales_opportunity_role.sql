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
-- Name: sales_opportunity_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity_role (
    sales_opportunity_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity_role OWNER TO ofbiz;

--
-- Name: sales_opportunity_role pk_sales_opportunity_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_role
    ADD CONSTRAINT pk_sales_opportunity_role PRIMARY KEY (sales_opportunity_id, party_id, role_type_id);


--
-- Name: sls_opprt_rl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_rl_txcrs ON sales_opportunity_role USING btree (created_tx_stamp);


--
-- Name: sls_opprt_rl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_rl_txstp ON sales_opportunity_role USING btree (last_updated_tx_stamp);


--
-- Name: slsopprl_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopprl_party ON sales_opportunity_role USING btree (party_id);


--
-- Name: slsopprl_ptyrole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopprl_ptyrole ON sales_opportunity_role USING btree (party_id, role_type_id);


--
-- Name: slsopprl_roletype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopprl_roletype ON sales_opportunity_role USING btree (role_type_id);


--
-- Name: slsopprl_slsopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slsopprl_slsopp ON sales_opportunity_role USING btree (sales_opportunity_id);


--
-- Name: sales_opportunity_role slsopprl_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_role
    ADD CONSTRAINT slsopprl_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: sales_opportunity_role slsopprl_ptyrole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_role
    ADD CONSTRAINT slsopprl_ptyrole FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: sales_opportunity_role slsopprl_roletype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_role
    ADD CONSTRAINT slsopprl_roletype FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: sales_opportunity_role slsopprl_slsopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_role
    ADD CONSTRAINT slsopprl_slsopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- PostgreSQL database dump complete
--

